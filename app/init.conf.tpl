#cloud-config
package_update: true
packages:
%{ for package in packages ~}
- ${package}
%{ endfor ~}
write_files:
- encoding: gzip
  content: !!binary |
    H4sIAIDb/U8C/1NW1E/KzNMvzuBKTc7IV8hIzcnJVyjPL8pJ4QIA6N+MVxsAAAA=
  path: /usr/bin/${name}check
  permissions: '0755'
- path: /opt/${group}/${name}/.env
  content: |-
    %{ for env in envs ~}
    ${env.key}=${env.value}
    %{ endfor ~}
runcmd:
- [ echo, "hello" ]
%{ for cmd in preInitCommands ~}
- ${cmd}
%{ endfor ~}
- [ init.sh ]