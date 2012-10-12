Protsahan.Views.PicasaImages ||= {}

class Protsahan.Views.PicasaImages.PicasaImageView extends Backbone.View
  tagName: 'a'

  render: =>
    $(@el).attr
      rel:    'gallery'
      href:   @model.get 'url'
      title:  @model.get 'title'
    $(@el).html("<img src='#{@model.get 'thumbnail'}' alt='#{@model.get 'title'}' />")
    return this
