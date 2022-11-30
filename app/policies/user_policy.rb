class UserPolicy < ApplicationPolicy
    class Scope < Scope
      # NOTE: Be explicit about which records you allow access to!
      def resolve; end
    end
    def index?
      return unless user.present?
      user.admin? || user.teacher? || user.student?
    end
    def create?
      return unless user.present?
      user.admin? || user.teacher? || user.student?
    end
    def update?
      return unless user.present?
      user.admin? || user.teacher? || user.student?
    end
    def show?
      return unless user.present?
      user.admin? || user.teacher? || user.student?
    end
    def destroy?
      return unless user.present?
      user.admin?
    end
  end
  
  