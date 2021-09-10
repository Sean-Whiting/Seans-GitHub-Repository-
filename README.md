## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[(/Seans-Github-Repository-/Diagram/Completed_Azure_Diagram.vsdx)]

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - [/Seans-Github-Repository-/Ansible/playbooks]

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly responsive , in addition to restricting unauthorized to the network.
- _A Load balancer could mask different virtual machines with a random public IP address, so they are really focused on the protection of a servers actualy IP._
_The reason I have used a Jump box is because it is a gateway, I created the jump-box to be the only way in and out into my virtual network._
Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file system and system resources.
- _Filebeat really helps produce and organize log files to send to logstash and Elasticsearch_
- _Metricbeat takes these metrics that it collects and sends them towards the output that, in this case me, specify, whether that is elasticsearch or Logstash._

The configuration details of each machine may be found below.
_(/Seans-GitHub-Repository-/Ansible/configs)_ 

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.5   | Linux            |
| Web 1    | server   | 10.0.0.8   | Linux            |
| Web 2    | server   | 10.0.0.9   | Linux            |
| Web 3    | server   | 10.0.0.10  | Linux            |
| Elk VM   | Kibana   | 10.1.0.5   | Linux            |
| LB       | Load-B   |13.88.41.110| no OS            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _75.167.212.27_

Machines within the network can only be accessed by Containers
I allowed my Jump-Box machine to access my Elk VM through port 22, Ip is 
- _10.1.0.5_

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 75.167.212.27        |
| Web 1    | no                  | 10.0.0.5             |
| Web 2    | no                  | 10.0.0.5             |
| Web 3    | no                  | 10.0.0.5             |
| Elk VM   | yes                 |10.0.0.5/75.167.212.27|  

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _we are able to redeploy and rebuild a server if necessary from just a simple execute command, compared if we didnt have a play book like this, we would have to build it from scratch_

The playbook implements the following tasks:
- _first step would to be install docker to get containers_
- _Next would be focusing on installing pip3, the python software__
- _Next, Increasing the Memory on the VM_
- _Finally,Installing Elk inside a docker container_
# Elk stack stands for elasticsearch, logstash, and kirbana. Elasticsearch is popular for logging, Logstash was added to make it easier to save logs from different machines into elasticsearch database.

_The location of the elk stack playbook is in (/Seans-GitHub-Repository-/Ansible/playbooks/my-elk-playbook.yml)_

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _Web 1: 10.0.0.8_
- _Web 2: 10.0.0.9_
- _Web 3: 10.0.0.10_

#We have installed the following Beats on these machines:

- _Web 1: Filebeat, Metricbeat_
- _Web 2: Filebeat, Metricbeat_
- _Web 3: Filebeat, Metricbeat_

These Beats allow us to collect the following information from each machine:
- _Filebeat is tasked with monitoring the system for local file changes, metric beat on the other hand logs the RAM and CPU utilization. Metric is always on top on making sure our system does not overwork itself._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the Filebeat configuration file to the Ansible container.
- Update the configuration file to include the IP of the Elk stack server.
- Run the playbook, and navigate to Kirbana to check that the installation worked as expected.

- _My playbook for the Elk server is under /Seans-Github-Repository-/Ansible/playbooks/my-elk-playbook.yml_
- _ The file to update to make sure the ansible playbook runs on a specific machine is through the host file, take a look at /Seans-Github-Repository-/Ansible/Configs/Hosts which
 will show you how I specified each installion to their machines, then go into my yml playbook files located in (/Seans-Github Repository-/Ansible/playbooks)
 on the top of those files you will see a host option, that is how you specify the installation to a specific VM. 
- to navigate to the kibana, go to http://[IP of Elk VM]in this case its 75.167.212.27, so http://75.167.212.27:5601/app/kibana

