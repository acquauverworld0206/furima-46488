class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations for new user attributes
  # 新規登録/ユーザー情報 のバリデーション
  validates :nickname, presence: true
  # パスワードは半角英数字混合
  # Deviseのデフォルトバリデーション（必須、6文字以上、確認との一致）はそのまま利用
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字混合で入力してください' }, allow_blank: true
  # パスワードは半角のみ
  validates :password, format: { with: /\A[ -~]+\z/, message: 'は半角で入力してください' }, allow_blank: true

  # 新規登録/本人情報確認 のバリデーション
  # お名前(全角)
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  # お名前カナ(全角)
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角（カタカナ）で入力してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角（カタカナ）で入力してください' }
  # 生年月日
  validates :birth_date, presence: true

  has_many :items
end
