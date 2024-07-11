module WithCleanPublicDir
  def with_clean_public_dir
    public_dir = File.expand_path('../public', __dir__)
    FileUtils.rm_rf(public_dir)
    FileUtils.mkdir_p(public_dir)

    yield public_dir
  end
end
