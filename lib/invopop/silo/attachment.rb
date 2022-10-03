# frozen_string_literal: true

module Invopop
  class Silo
    class Attachment
      include Hashme

      property :id, String
      property :created_at, Time

      property :name, String
      property :desc, String
      property :hash, String
      property :mime, String
      property :size, Integer
      property :stored, Boolean
      property :url, URI

      property :meta, Hash
    end
  end
end
