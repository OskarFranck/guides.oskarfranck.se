module ApplicationHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id] 
  end

  def flash_class_for(type)
    {
      notice: "is-info",
      alert: "is-danger",
      success: "is-success",
      warning: "is-warning"
    }[type.to_sym] || "is-dark"
  end

  def footer_quotes
     @quotes = [
      "The unexamined life is not worth living.",
      "I think, therefore I am.",
      "Man is the measure of all things.",
      "One cannot step twice into the same river.",
      "To be is to be perceived.",
      "Happiness is the highest good.",
      "God is dead.",
      "Liberty consists in doing what one desires.",
      "Life must be understood backward. But it must be lived forward.",
      "We are what we repeatedly do. Excellence, then, is not an act but a habit.",
      "That which does not kill us makes us stronger.",
      "The only thing I know is that I know nothing.",
      "The greatest happiness of the greatest number is the foundation of morals and legislation.",
      "Man is born free, and everywhere he is in chains.",
      "Morality is not the doctrine of how we may make ourselves happy, but how we may make ourselves worthy of happiness.",
      "All men by nature desire to know.",
      "Freedom is the recognition of necessity.",
      "He who opens a school door, closes a prison.",
      "It is not length of life, but depth of life.",
      "Man is nothing else but what he makes of himself.",
      "Knowledge is power.",
      "Things are not bad in themselves, but our opinions about things are.",
      "Reason is, and ought only to be the slave of the passions.",
      "Even while they teach, men learn.",
      "The mind is furnished with ideas by experience alone.",
      "The limits of my language mean the limits of my world.",
      "The only true wisdom is in knowing you know nothing.",
      "Existence precedes essence.",
      "Without music, life would be a mistake.",
      "All that is necessary for the triumph of evil is that good men do nothing."
    ]
  end
end
