class AnimeWorker
  include Sidekiq::Worker

  def perform
    # ActiveRecord::Base.connection_pool.with_connection do
    Anime.reindex
    # end
  end
end