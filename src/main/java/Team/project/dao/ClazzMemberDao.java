package Team.project.dao;

import java.util.List;
import Team.project.domain.ClazzMember;

public interface ClazzMemberDao {

  public int insert(ClazzMember clazzMember) throws Exception;

  public List<ClazzMember> findAll() throws Exception;

  public ClazzMember findByNo(int no) throws Exception;

  public int update(ClazzMember clazzMember) throws Exception;

  public int delete(int no) throws Exception;
}
