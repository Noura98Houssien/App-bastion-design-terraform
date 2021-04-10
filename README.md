<h2> create application bastion infrastructure design using terraform with the following requirment</h2>
<h3> Network design</h3>
<ul>
  <li>create vpc</li>
  <li>create internet gateway</li>
  <li>create public route table</li>
  <li>create private route table</li>
  <li>attach public route table to subnets</li>
  
</ul>
<h3> app-bastion design</h3>
<ul>
<li>create security group which allow ssh from 0.0.0.0/0</li>
<li>create security group that allow ssh and port 3000 from vpc cidr only</li>
<li>create ec2(bastion) in public subnet with security group from the 1st one</li>
<li>create ec2(application) private subnet with security group from the 2nd one</li>

</ul>
