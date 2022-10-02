provider "aws" {
  region = var.region
  secret_key = var.secret_key 
  access_key = var.access_key
}

resource "aws_instance" "instance" {

    count                  = var.instance_count
    ami                    = var.ami
    instance_type          = var.instance_type
    key_name               = var.key_name
    vpc_security_group_ids = [aws_security_group.ins_sg.id]

    tags = {
        Name = element(var.instance_tags, count.index)
    }
    
}

resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
    {
        instance_one = aws_instance.instance[0].public_ip,
        instance_two = aws_instance.instance[1].public_ip,
    })
    filename = "../Ansible/inventory"
}

resource "local_file" "ansible_script" {
 content = templatefile("ssh_a_playbook.tmpl",
    {
        key_name= var.key_name
    })
    filename = "./ssh_a_playbook.sh"
    depends_on = [ 
            local_file.AnsibleInventory
        ]
}

resource "null_resource" "run_ansible" {
	   
    provisioner "local-exec" {
        command ="chmod +x ssh_a_playbook.sh && sh ./ssh_a_playbook.sh"
        }
        depends_on = [ 
            local_file.ansible_script
        ]
}

