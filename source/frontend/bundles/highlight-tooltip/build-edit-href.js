import {relativePath, monorepoSitePathFragment} from './path-helpers'

function buildEditHref() {
  //"#{data.site.repo}blob/master/source/#{full_path}"

  const repo = document.querySelector('meta[property="og:repo"]').content

  return `${repo}blob/master/${monorepoSitePathFragment()}source/${relativePath()}`
}

export default buildEditHref