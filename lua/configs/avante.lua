local opts = {
  -- add any opts here
  -- for example
  provider = "openai",
  providers = {
    openai = {
      endpoint = "https://api.openai.com/v1",
      model = "gpt-4.1-mini",
      timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
      extra_request_body = {
        temperature = 1,
        max_completion_tokens = 20480,
      },
    },
  }
}
return opts
