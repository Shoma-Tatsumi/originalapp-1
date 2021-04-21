# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, message: 'Include both letters and numbers.' }, on: :create

  validates :age, numericality: { only_integer: true, message: 'Half-width number' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :years_of_experience
end
