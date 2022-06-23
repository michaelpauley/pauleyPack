
#' Title
#'
#' @return folder structure, app.R file, and global.R file
#' @export
#'
#' @examples generateSkeleton()
generateSkeleton <- function() {
  require(shiny)

  dir.create("data")
  dir.create("fun")
  dir.create("www")
  file.create("global.R")
  file.create("app.R")

  write_global <- function(...) {
    write(..., file = "global.R", append = TRUE)
  }


  write_global("library(shiny)")
  write_global("")
  write_global("app_theme <- bslib::bs_theme(")
  write_global("  version = 4,")
  write_global("  bootswatch = 'cerulean',")
  write_global("  primary = '#1589C9',")
  write_global("  secondary = '#F8C02C')")

  write_app <- function(...) {
    write(..., file = "app.R", append = TRUE)
  }
  write_app("#source in global file which holds functions/text/and table")
  write_app("source('global.R')")
  write_app("")
  write_app("# 1.0 Build UI ----")
  write_app("ui <- fluidPage(")
  write_app("  shiny::navbarPage(")
  write_app("    title = 'APP TITLE',")
  write_app("    theme = app_theme,")
  write_app("")
  write_app("    # Create a Home menu item")
  write_app("    shiny::tabPanel(")
  write_app("      title = 'Home',")
  write_app("        #create a fluid row for the sidebar/well panel")
  write_app("        shiny::fluidRow(")
  write_app("          shiny::column(width=3,")
  write_app("")
  write_app("          shiny::wellPanel(shiny::h5('Input Panel'),hr(),")
  write_app("            ## 1.1 Inputs used on home page ----")
  write_app("            shiny::fluidRow(")
  write_app("              shiny::column(width = 12,")
  write_app("                selectInput(inputId = 'input_one', label = 'Select Input:', choices = c('Option A', 'Option B'))),")
  write_app("              shiny::column(width = 12,")
  write_app("                numericInput(inputId = 'input_two', label = 'Numeric Input:', value = 1)),")
  write_app("              shiny::column(width = 12,")
  write_app("                actionButton(inputId = 'run_button', label = 'Run',icon = shiny::icon(name = 'atom')))))),")
  write_app("        shiny::column(width = 9,")
  write_app("          shiny::h5('Results'),br(),")
  write_app("            shiny::fluidRow(")
  write_app("              shiny::column(width = 12,")
  write_app("                tableOutput('demo_table')))),hr())),")
  write_app("")
  write_app("    # Create an ABOUT menu item")
  write_app("    shiny::tabPanel(id = 'about_page',")
  write_app("      title = 'About',")
  write_app("      fluidRow(")
  write_app("        column(width = 6,")
  write_app("        shiny::h5('About the App'),")
  write_app("        'Add content here.')))))")
  write_app("")
  write_app("")
  write_app("server <- function(input, output, session) {")
  write_app("")
  write_app("# 1.0 Create Reactive List ----")
  write_app("  rctv <- reactiveValues()")
  write_app("")
  write_app("}")
  write_app("")
  write_app("shinyApp(ui, server)")


}


