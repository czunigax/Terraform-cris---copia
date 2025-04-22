variable "subscription_id" {
    type = string
    description = "valor de la suscripcion"
}

variable "tags" {

type = map(string)
description = "valores de los tags"
default = {
    environment = "produccion"
    date = "2025-13-03"
    createdBy = "Cris"
}

}

variable "name_Project" {
    type = string
    description = "nombre del proyecto"
    default = "proyecto2"
}

variable "enviroment"{
    type =  string
    description = "entorno"
    default = "dv"
}

variable "location"  {
    type = string
    description = "locacion"
    default = "Central US"
}

variable "administrator_login_password" {
    type = string
    description = "valor de la contrasena"
  
}