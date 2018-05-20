# I18n 라이브러리에 번역문을 저장해둔 장소를 알려준다.
I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
 
# 기본 로케일을 :pt로 설정한다.
I18n.default_locale = :ko