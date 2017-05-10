class CragsController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]
end
