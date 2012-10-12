Protsahan.Views.PicasaImages ||= {}

class Protsahan.Views.PicasaImages.PicasaImageView extends Backbone.View
  template: JST["templates/picasa_images/picasa_image"]
  tagName: 'span'

  events:
    "click .destroy" : "destroy"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
