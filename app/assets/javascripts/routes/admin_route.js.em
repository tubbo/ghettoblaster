class Ghettoblaster.AdminRoute extends Em.Route
  setupController: (model, controller) ->
    controller.model = model
    controller.currentUser = @store.find 'user', id: session.user_id
    @transitionTo 'admin/login' unless controller.currentUser
