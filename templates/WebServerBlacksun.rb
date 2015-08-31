# Main webserver: reason

CloudFormation {
    Description 'Build the backsun.cx server'

    EC2_Instance('blacksun1') {
        InstanceType 't2.micro'
        ImageId 'ami-e4ff5c93'
        KeyName 'blacksun-devops'
        SecurityGroupIds ['sg-12dc6f77', 'sg-b9c332dd']
        Tags([
            { Key: 'Name', Value: 'blacksun1' }
        ])
        UserData FnBase64( FnFormat( <<EOF,
#cloud-config
timezone: Europe/London
write_files:
  - path: /etc/motd
    permissions: 0644
    owner: root
    encoding: base64
    content: |
      R29vZCBuZXdzLCBldmVyeW9uZSwKY2xvdWQtY29uZmlnIGhhcyB3b3JrZWQhCg==
system_info:
  default_user:
    name: blacksun1
EOF
        {}))
    }
}
