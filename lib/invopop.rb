# frozen_string_literal: true

require 'faraday'

require_relative 'invopop/client'
require_relative 'invopop/connection'
require_relative 'invopop/namespace'
require_relative 'invopop/resource'
require_relative 'invopop/silo'
require_relative 'invopop/silo/envelopes'
require_relative 'invopop/transform'
require_relative 'invopop/transform/jobs'
require_relative 'invopop/utils'
require_relative 'invopop/utils/ping'
require_relative 'invopop/utils/uuid'
require_relative 'invopop/version'

# Root module of the library
module Invopop
end
