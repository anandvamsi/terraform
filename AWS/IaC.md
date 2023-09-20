## IaC
Infrastructure as Code (IaC) enables you to provision your servers,security and configration files with version control . The beauty of IaC is that it can be shared and re-used to build similar environment.

Terraform is one of the most popular IaC tool due to its platform agnostic behvaior, it can be applied any cloud platform(AWS,GCP etc)

- Verion control
You can store your IAC source files in version control, which means the entire history of your infrastructure is now captured in the commit log

- Automation and Faster
If the deployment process is automated, it’ll be significantly faster, since a computer can carry out the deployment steps far faster than a person, and safer, since an automated process will be more consistent, more repeatable, and not prone to manual error

- Documentation
In other words, IAC acts as documentation, allowing everyone in the organization to understand how things work.

- Code reusbility
Code can reused by changing the setting and provisiong the resources.

- Preview and validation
	ESP in terraform  we can preview the code before apply to the cloud.

- Reability
	It is having good readbility.

```hcl
resource "aws_instance" "example" {
  ami = "ami-40d28157"
  instance_type = "t2.micro"
}
```
