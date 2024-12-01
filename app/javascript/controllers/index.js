// Stimulus controllers loader
import { application } from "./application";

import { definitionsFromContext } from "@hotwired/stimulus-loading";

const context = require.context("controllers", true, /\.js$/);
application.load(definitionsFromContext(context));
