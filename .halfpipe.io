team: engineering-enablement

repo:
  uri: https://github.com/simonjohansson/cf-push.git

tasks:
- task: docker
  username: ((docker.username))
  password: ((docker.password))
  repository: simonjohansson/cf-push
