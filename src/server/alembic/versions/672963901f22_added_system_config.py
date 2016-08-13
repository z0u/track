"""Added system config

Revision ID: 672963901f22
Revises:
Create Date: 2016-08-13 15:46:39.025355

"""

# revision identifiers, used by Alembic.
revision = '672963901f22'
down_revision = None
branch_labels = None
depends_on = None

from alembic import op
import sqlalchemy as sa


def upgrade():
    op.create_table('system_config',
        sa.Column('name', sa.String(), nullable=False),
        sa.Column('value', sa.String(), nullable=False),
        sa.PrimaryKeyConstraint('name')
    )


def downgrade():
    op.drop_table('system_config')
