# Events for the unsubscribe form.
class Ghettoblaster.UnsubscribeFormView extends Em.View
  tagName: 'form'
  action: '/subscribers'
  method: 'DELETE'
  attributeBindings: ['action', 'method']
  submit: (event) ->
    subscriber = @store.find 'subscriber', email: params.email
    @store.deleteRecord subscriber if subscriber?
    @route.transitionTo 'thanks'
    false
