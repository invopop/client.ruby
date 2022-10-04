//go:build mage
// +build mage

package main

import (
	"github.com/magefile/mage/sh"
)

const (
	name     = "client.ruby"
	runImage = "ruby:2.7"
)

// Runs gem's setup script (install dependencies…)
func Setup() error {
	return dockerRunCmd(name+"-install", "", "bin/setup")
}

// Runs gem's rspec tests.
func Spec() error {
	return dockerRunCmd(name, "", "bundle", "exec", "rake", "spec")
}

// Runs an interactive shell within a docker container.
func Shell() error {
	return dockerRunCmd(name+"-shell", "", "bash")
}

// Runs an IRB session with the library required.
func Console() error {
	return dockerRunCmd(name, "", "bin/console")
}

func dockerRunCmd(name, publicPort string, cmd ...string) error {
	args := []string{
		"run",
		"--rm",
		"--name", name,
		"--network", "invopop-local",
		"-v", "$PWD:/app",
		"-v", "$PWD/.tmp_bundle:/usr/local/bundle",
		"-v", "$PWD/spec/support/keys:/root/.gobl",
		"-w", "/app",
		"-it",
	}
	if publicPort != "" {
		args = append(args,
			"--label", "traefik.enable=true",
			"--label", "traefik.http.routers."+name+".rule=Host(`"+name+".invopop.dev`)",
			"--label", "traefik.http.routers."+name+".tls=true",
			"--label", "traefik.http.services."+name+".loadbalancer.server.port="+publicPort,
			"--expose", publicPort,
		)
	}
	args = append(args, runImage)
	args = append(args, cmd...)
	return sh.RunV("docker", args...)
}
