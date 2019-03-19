Maid.rules do
  rule 'Sample rule' do
    log("This is a sample rule")
    log("Check out https://github.com/benjaminoakes/maid for more examples")
    log(cmd("pwd"))
  end
end
