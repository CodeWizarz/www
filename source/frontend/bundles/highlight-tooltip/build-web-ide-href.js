import {relativePath, monorepoSitePathFragment} from './path-helpers'

function buildWebIdeHref() {
  const instance = document.querySelector('meta[property="og:instance"]').content
  const path = document.querySelector('meta[property="og:path"]').content

  return `${instance}-/ide/project/${path}edit/master/-/${monorepoSitePathFragment()}source/${relativePath()}`
}

export default buildWebIdeHref