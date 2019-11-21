class StaticPagesController < ApplicationController
  def home
    fresh_when true
  end
end
