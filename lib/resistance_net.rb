class ResistanceNet
  delegate :to_dot, :to => :@net
  
  def initialize round, opts={}
    @net = BayesNet.new
    @round = round
    @game = round.game
    @lc = opts[:leader_cleverness] || 0
    @vc = opts[:voter_cleverness] || 0
    @sc = opts[:spy_cleverness] || 0
    make_graph
    make_tables
  end
  
  private
  
  def prior_odds
    [prior_spy_odds, 1.0 - prior_spy_odds].clone
  end
  
  def leader_odds
    [leader_spy_odds, 1.0 - leader_spy_odds].clone
  end
  
  def leader_spy_odds
    @round.leader.spy_odds
  end
  
  def make_graph
    make_nodes :voter, [:spy, :agent],
               :leader, [:spy, :agent],
               :team, [:spy, :agent],
               :vote, [:for, :against],
               :mission, [:fail, :pass]
    make_edges :voter, :vote, :leader, :team,
               :team, :vote, :team, :mission
  end
  
  def make_tables
    set_table @voter, [], prior_odds
    set_table @leader, [], leader_odds
    set_table @team, [@leader], [1-@lc, @lc, 0, 1]
    set_table @mission, [@team], [1-@sc, @sc, 0, 1]
    set_table @vote, [@voter, @team], [1-@vc, @vc, @vc, 1-@vc, 0, 1, 1, 0]
  end
  
  def set_table node, inputs, table
    node.set_probability_table inputs, table.map(&:to_f)
  end
  
  def make_nodes *args
    args.in_groups_of(2).each do |(name,outcomes)|
      node = BayesNetNode.new name.to_s.capitalize, outcomes
      @net.add_vertex node
      instance_variable_set "@#{name}", node
    end
  end
  
  def make_edges *nodes
    nodes.in_groups_of(2).each do |edge|
      @net.add_edge *edge
    end
  end
end