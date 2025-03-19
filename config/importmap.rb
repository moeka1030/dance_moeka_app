pin "application" #application.jsのインポート
pin "@hotwired/turbo-rails", to: "turbo.min.js" #ページ遷移を早く
pin "@hotwired/stimulus", to: "stimulus.min.js" #インタラクティブなUI
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"


