#!/bin/bash

##Install nginx server on Amazon linux 2
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y 
sudo systemctl enable nginx
sudo systemctl start nginx

## create directory in nginx root path
sudo mkdir /usr/share/nginx/html/vend_ip


## Define the filename for the HTML file
html_file="/home/ec2-user/index.html"

##Get VPC ID of Load balancer and use it in describe VPC command to get CIDR details
export vpc_id=$(aws elbv2 describe-load-balancers --query LoadBalancers[*].VpcId --output text --region us-west-1)
export ip=$(aws ec2 describe-vpcs --vpc-ids $vpc_id --query Vpcs[*].CidrBlockAssociationSet[*].CidrBlock --output text --region us-west-1 | cut -d "/" -f 1)
export subnet=$(aws ec2 describe-vpcs --vpc-ids $vpc_id --query Vpcs[*].CidrBlockAssociationSet[*].CidrBlock --output text --region us-west-1 | cut -d "/" -f 2)


# Open the HTML file for writing
echo "<!DOCTYPE html>" > "$html_file"
echo "<html>" >> "$html_file"
echo "<head>" >> "$html_file"
echo "    <title>Generated HTML</title>" >> "$html_file"
echo "</head>" >> "$html_file"
echo "<body>" >> "$html_file"
echo "    <h1>VPC CIDR Block of Application Load Balancer</h1>" >> "$html_file"
echo "<p>{<br></p>" >> "$html_file"
echo "<p><pre> &nbsp; "ip_address:" "$ip",</pre></p>" >> "$html_file"
echo "<p><pre> &nbsp; "subnet_size": "$subnet"</pre></p>" >> "$html_file"
echo "<p>}<br></p>" >> "$html_file"
echo "</body>" >> "$html_file"
echo "</html>" >> "$html_file"

# Reload nginx configuration
sudo mv /home/ec2-user/index.html /usr/share/nginx/html/vend_ip/
sudo systemctl restart nginx