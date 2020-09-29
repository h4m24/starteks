teardown:	
	cd k8s_config && terraform destroy -auto-approve
	cd aws_resources/resources && terraform destroy -auto-approve
	cd aws_resources/state_backend_resources && terraform destroy -auto-approve

buildup:
	cd aws_resources/state_backend_resources && terraform apply -auto-approve
	cd aws_resources/resources && terraform apply -auto-approve
	cd k8s_config && terraform apply -auto-approve

test:	
	test -f ~/.aws/credentials && echo "~/.aws/credentials file exists, Success" \
	[ -z "$TF_VAR_AWS_ACCOUNT_ID" ] && echo "variable is not empty , Success"
