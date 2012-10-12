class Protsahan.Routers.PicasaImagesRouter extends Backbone.Router
  initialize: (options) ->
    @picasa_images = new Protsahan.Collections.PicasaImagesCollection [],
      user: '110278106735349479057'
      album: 'Lastbatchofpictures'
    @picasa_images.fetch()

  routes:
    "index"    : "index"
    ":id"      : "show"
    ".*"        : "index"

  index: ->
    @view = new Protsahan.Views.PicasaImages.IndexView(picasa_images: @picasa_images)
    $(".content").html(@view.render().el)

  show: (id) ->
    picasa_image = @picasa_images.get(id)

    @view = new Protsahan.Views.PicasaImages.ShowView(model: picasa_image)
    $(".content").html(@view.render().el)
