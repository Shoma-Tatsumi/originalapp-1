# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :recruitments
  has_many :comments
  has_one_attached :image
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  validates :nickname, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, message: 'は半角文字と半角数字の両方を含めてください' }, on: :create

  # validates :age, numericality: { only_integer: true, message: '半角数字のみ' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :years_of_experience
end
