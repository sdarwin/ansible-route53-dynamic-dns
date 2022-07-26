
# Route53 Dynamic DNS

[Amazon Web Services - Labs](https://github.com/awslabs) has provided an interesting and helpful solution to the problem of updating DNS records when a client's IP address changes. It can be found at [https://github.com/awslabs/route53-dynamic-dns-with-lambda](https://github.com/awslabs/route53-dynamic-dns-with-lambda). 

The goal of this Ansible role is to install and manage route53-dynamic-dns-with-lambda. The cloudformation template and client scripts are taken from that repository. You might consider installing route53-dynamic-dns-with-lambda manually first without the aid of Ansible, in order to learn how the system works.

## Instructions

Review defaults/main.yml, and configure required variables locally in groups_vars/all (or other file). Refer to the [original docs](https://github.com/awslabs/route53-dynamic-dns-with-lambda) for an explanation of most of those variables.

On the ansible control machine, install boto3 and the AWS CLI. Configure the cli with credentials to be able to launch cloudformation stacks. `aws configure`. Refer to scripts/install-control-node.sh. The IAM user requires a set of permissions covered in files/iam_policy_route53_ddns_admin_general, that could be locked down further.

In the inventory, add hosts to the route53_ddns_clients group.

The playbook can be run in its entirety, or only in sections:

Everything:  
```
ansible-playbook playbooks/default.yml
```

The AWS infrastructure tasks:  
```
ansible-playbook -t cloud playbooks/default.yml
```

The client scripts:  
```
ansible-playbook -t client playbooks/default.yml
```

That should cover the basic usage. Additional topics or faqs may be added in [docs/discussion.md](docs/discussion.md).


