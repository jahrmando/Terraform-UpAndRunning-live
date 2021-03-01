package test

import (
  "github.com/gruntwork-io/terratest/module/terraform"
  "testing"
)

func TestAlbExample(t *testing.T) {
  opts := &terraform.Options{
    // you should update this relative path to point at your ALB
    TerraformDir: "../examples/alb"
  } 
}
