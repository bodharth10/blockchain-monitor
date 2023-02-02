# frozen_string_literal: true

class UnconfirmedTransactionsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :data
end
