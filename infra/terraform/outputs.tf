output "connect_to_ec2" {
  value = format("%s%s", "ssh -i ./infra/terraform/access/ec2-key ec2-user@", module.queuer.public_dns)
}

output "created_sns_topic" {
  value = module.sns_topic.testing_topic
}

output "created_sqs_queue" {
  value = module.sqs_queue.testing_queue
}