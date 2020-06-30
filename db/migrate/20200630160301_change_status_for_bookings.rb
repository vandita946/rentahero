class ChangeStatusForBookings < ActiveRecord::Migration[6.0]
  def change
    change_column_default :bookings, :status, "Requested"
  end
end
