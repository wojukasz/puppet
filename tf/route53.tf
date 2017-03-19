provider "aws" {
    region = "eu-west-1"
    shared_credentials_file = "/home/alan/.config/aws/creds"

}

data "aws_route53_zone" "ajenkinscom" {
    name = "alan-jenkins.com."
}

resource "aws_route53_record" "skyfactory3A" {
    zone_id = "${data.aws_route53_zone.ajenkinscom.zone_id}"
    name = "skyfactory3.alan-jenkins.com"
    type = "A"
    ttl = "60"
    records = ["149.202.87.162"]
}

resource "aws_route53_record" "skyfactory3SRV" {
    zone_id = "${data.aws_route53_zone.ajenkinscom.zone_id}"
    name = "skyfactory3.alan-jenkins.com"
    type = "SRV"
    ttl = "60"
    records = ["1 1 25566 _minecraft._tcp.skyfactory3.alan-jenkins.com"]
}
