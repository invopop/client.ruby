# frozen_string_literal: true

module Invopop
  class Transform
    class Attachment
      include Hashme

      property :id, String
      property :name, String
      property :desc, String
      property :hash, String
      property :mime, String
      property :size, Integer
      property :url, URI
      property :meta, Hash
    end
  end
end
