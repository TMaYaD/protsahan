Protsahan.Views.PicasaImages ||= {}

class Protsahan.Views.PicasaImages.IndexView extends Backbone.View
  tagName: 'p'

  initialize: () ->
    @options.picasa_images.bind('reset', @addAll)

  addAll: () =>
    @options.picasa_images.each(@addOne)

  addOne: (picasa_image) =>
    view = new Protsahan.Views.PicasaImages.PicasaImageView({model : picasa_image})
    $(@el).append(view.render().el)

  render: =>
    $(@el).attr
      'data-toggle': 'modal-gallery'
      'data-target': '#modal-gallery'
    @addAll()

    return this
