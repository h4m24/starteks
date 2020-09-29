teardown:	
	cd k8s_config && terraform destroy -auto-approve
	cd aws_resources/resources && terraform destroy -auto-approve
	aws s3 rm  s3://h4m24-terraformstate/eks && aws s3 rm  s3://h4m24-terraformstate/k8s
	cd aws_resources/state_backend_resources && terraform destroy -auto-approve

buildup:
	cd aws_resources/state_backend_resources && terraform init && terraform apply -auto-approve
	cd aws_resources/resources && terraform init && terraform apply -auto-approve
	aws eks update-kubeconfig --name EKSTEST --alias EKSTEST
	cd k8s_config && terraform init && terraform apply -auto-approve

test:	
	test -f ~/.aws/credentials && echo "~/.aws/credentials file exists, Success" \
	[ -z "$TF_VAR_AWS_ACCOUNT_ID" ] && echo "variable is not empty , Success"
