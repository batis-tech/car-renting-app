// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
  //= require chosen-jquery
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "stylesheet/application"
require("packs/cutome")
require("packs/country")
require("packs/client_country")
require("packs/maker")
require("packs/purchases")
Rails.start()
Turbolinks.start()
ActiveStorage.start()
