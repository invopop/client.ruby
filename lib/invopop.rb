# frozen_string_literal: true

require 'faraday'
require 'gobl'
require 'hashme'

require_relative 'invopop/client'
require_relative 'invopop/connection'
require_relative 'invopop/connection/error_manager'
require_relative 'invopop/error'
require_relative 'invopop/namespace'
require_relative 'invopop/resource'
require_relative 'invopop/silo'
require_relative 'invopop/silo/attachment'
require_relative 'invopop/silo/entry'
require_relative 'invopop/silo/entry_collection'
require_relative 'invopop/silo/entries'
require_relative 'invopop/transform'
require_relative 'invopop/transform/attachment'
require_relative 'invopop/transform/event'
require_relative 'invopop/transform/intent'
require_relative 'invopop/transform/job'
require_relative 'invopop/transform/jobs'
require_relative 'invopop/utils'
require_relative 'invopop/utils/ping'
require_relative 'invopop/utils/uuid'
require_relative 'invopop/version'

# Root module of the library
module Invopop
end
