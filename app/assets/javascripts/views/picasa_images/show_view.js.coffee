Protsahan.Views.PicasaImages ||= {}

class Protsahan.Views.PicasaImages.ShowView extends Backbone.View
  template: JST["templates/picasa_images/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
