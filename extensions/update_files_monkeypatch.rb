# The `ensure_resource_list_updated!` method is very expensive.
# See: https://github.com/middleman/middleman/blob/master/middleman-core/lib/middleman-core/sitemap/store.rb#L168
#
# This monkeypatch should duplicate the behavior of Middleman::Sitemap::Extensions::OnDisk::update_files,
# EXCEPT when we explicitly opt in to the augmented behavior.
# The `update_files` method is very important to the preview server appropriately rebuilding templates.
# But when it's run for `OnDisk`, it forces the expensive `ensure_resource_list_updated!` method to be called.
# See: https://github.com/middleman/middleman/blob/3ca518d3e17569f01d62d831c7463b14393d8799/middleman-core/lib/m iddleman-core/sitemap/extensions/on_disk.rb#L42
#
# By returning early from `update_files`, we avoid running `ensure_resoure_list_updated!`, and if you've only changed things like template files,
# The Middleman preview server will just call `render` on the resource, and your change will be reflected.
#
# This doesn't fix slow rebuild times for changes to data files. So if you edit something like `data/topics/ci-cd.yml`,
# your next request to the preview server will still force an `ensure_resource_list_updated!` call.
# You can observe that behavior here: https://github.com/middleman/middleman/blob/master/middleman-core/lib/middleman-core/core_extensions/data/stores/local_file.rb#L35
#
# Still, this monkeypatch makes template editing much much snappier.

module Middleman
  module Sitemap
    module Extensions
      class OnDisk < Extension
        # It's important that `rebuild_resource_list!` and `ensure_resource_list_updated!` happen as intended during the initial lifecycel
        # But after the preview server is ready, we can augment that behavior more safely.
        # Opt in to this change by setting DISABLE_ON_DISK_REBUILD to true when you run Middleman
        def ready
          @app.config[:disable_on_disk_rebuild] = true
          logger.info '== NOTICE: you have run Middleman with DISABLE_ON_DISK_REBUILD=true. This is experimental and things may break.'
        end

        def update_files(updated_files, removed_files)
          # This should mirror
          return if (updated_files + removed_files).all?(&method(:ignored?)) || @app.config[:disable_on_disk_rebuild]

          @app.sitemap.rebuild_resource_list!(:touched_file)
          @app.sitemap.ensure_resource_list_updated! unless @waiting_for_ready || @app.build?
        end
      end
    end
  end
end
