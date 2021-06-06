output "connect_to_producer" {
  value = format("%s%s", "ssh -i ./infra/terraform/access/ec2-key ec2-user@", module.producer.public_dns)
}

output "connect_to_consumer" {
  value = format("%s%s", "ssh -i ./infra/terraform/access/ec2-key ec2-user@", module.consumer.public_dns)
}

output "created_sns_topic" {
  value = module.sns_topic.testing_topic
}

output "created_sqs_queue" {
  value = module.sqs_queue.testing_queue
}