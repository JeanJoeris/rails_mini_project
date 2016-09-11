class Sighting < ApplicationRecord
  belongs_to :animal
  belongs_to :location
  belongs_to :user

  validates :sighting_time, presence: true

  def short_sighting_text
    if non_sighting
      "#{animal.name} was not sighted at #{location.name}"
    else
      "#{animal.name} was sighted at #{location.name}"
    end
  end

  def full_sighting_text
    if non_sighting
      "#{animal.name} was not sighted at #{location.name} at #{sighting_time.strftime("%H:%M")} on #{sighting_time.strftime("%B %d")} by #{user.name}"
    else
      "#{animal.name} was sighted at #{location.name} at #{sighting_time.strftime("%H:%M")} on #{sighting_time.strftime("%B %d")} by #{user.name}"
    end
    # <%= @sighting.animal.name %> was
    # <% if @sighting.non_sighting %>
    # <strong>not</strong>
    # <% end %>
    # spotted at <%= @sighting.location.name %>
    # at <%= @sighting.sighting_time.strftime("%H:%M") %> on <%= @sighting.sighting_time.strftime("%B %d") %>
    # by <%= @sighting.user.name %>
  end
end
