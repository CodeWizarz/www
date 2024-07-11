module TrialsHelper
  def saas_trial_entrypoint_url(glm_content: 'free-trial')
    "https://gitlab.com/-/trial_registrations/new?glm_source=about.gitlab.com&glm_content=#{glm_content}"
  end
end
