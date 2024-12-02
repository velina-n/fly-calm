# Pin npm packages by running ./bin/importmap
# config importmap.rb
pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "plyr", to: "https://cdn.skypack.dev/plyr@3.7.8"
pin "animations/circle_animation", to: "animations/circle_animation.js"
pin "animations/bar_animation", to: "animations/bar_animation.js"
pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
