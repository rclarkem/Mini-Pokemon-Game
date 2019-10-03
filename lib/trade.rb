class Trade < ActiveRecord::Base
    belongs_to :trade_initiator, class_name: "Trainer", foreign_key: "trade_initiator_id"
    belongs_to :trade_target, class_name: "Trainer", foreign_key: "trade_target"

end